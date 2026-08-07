/**
 * Theme-aware footer for Pi.
 *
 * Enabled automatically in TUI mode. Use `/footer` to toggle it, or
 * `/footer custom` and `/footer default` to select a mode explicitly.
 */

import { isAbsolute, relative, resolve, sep } from "node:path";
import type { ExtensionAPI, ExtensionContext } from "@earendil-works/pi-coding-agent";
import { truncateToWidth, visibleWidth } from "@earendil-works/pi-tui";

interface UsageTotals {
	input: number;
	output: number;
	cacheRead: number;
	cacheWrite: number;
	cost: number;
	latestCacheHitRate?: number;
}

type MetricId = "input" | "output" | "cacheRead" | "cacheWrite" | "cacheHit" | "cost" | "context";
type FooterColor = "accent" | "success" | "warning" | "error" | "muted" | "dim" | "mdLink" | "customMessageLabel";
type ThinkingColor =
	| "thinkingOff"
	| "thinkingMinimal"
	| "thinkingLow"
	| "thinkingMedium"
	| "thinkingHigh"
	| "thinkingXhigh"
	| "thinkingMax";

function finiteNumber(value: unknown): number {
	return typeof value === "number" && Number.isFinite(value) ? value : 0;
}

function addUsage(totals: UsageTotals, value: unknown): void {
	if (!value || typeof value !== "object") return;
	const usage = value as Record<string, unknown>;
	totals.input += finiteNumber(usage.input);
	totals.output += finiteNumber(usage.output);
	totals.cacheRead += finiteNumber(usage.cacheRead);
	totals.cacheWrite += finiteNumber(usage.cacheWrite);

	const cost = usage.cost;
	if (cost && typeof cost === "object") {
		totals.cost += finiteNumber((cost as Record<string, unknown>).total);
	}
}

function collectUsage(ctx: ExtensionContext): UsageTotals {
	const totals: UsageTotals = { input: 0, output: 0, cacheRead: 0, cacheWrite: 0, cost: 0 };

	for (const value of ctx.sessionManager.getEntries()) {
		const entry = value as unknown as {
			type?: string;
			message?: { role?: string; usage?: unknown };
			usage?: unknown;
		};

		if (entry.type === "message" && entry.message?.role === "assistant") {
			addUsage(totals, entry.message.usage);

			const usage = entry.message.usage as Record<string, unknown> | undefined;
			if (usage) {
				const promptTokens =
					finiteNumber(usage.input) + finiteNumber(usage.cacheRead) + finiteNumber(usage.cacheWrite);
				if (promptTokens > 0) {
					totals.latestCacheHitRate = (finiteNumber(usage.cacheRead) / promptTokens) * 100;
				}
			}
		} else if (entry.type === "message" && entry.message?.role === "toolResult") {
			addUsage(totals, entry.message.usage);
		} else if (entry.type === "branch_summary" || entry.type === "compaction") {
			addUsage(totals, entry.usage);
		}
	}

	return totals;
}

function formatTokens(count: number): string {
	if (count < 1_000) return Math.round(count).toString();
	if (count < 10_000) return `${(count / 1_000).toFixed(1)}k`;
	if (count < 1_000_000) return `${Math.round(count / 1_000)}k`;
	if (count < 10_000_000) return `${(count / 1_000_000).toFixed(1)}M`;
	return `${Math.round(count / 1_000_000)}M`;
}

function formatCwd(cwd: string): string {
	const home = process.env.HOME || process.env.USERPROFILE;
	if (!home) return cwd;

	const resolvedCwd = resolve(cwd);
	const resolvedHome = resolve(home);
	const relativeToHome = relative(resolvedHome, resolvedCwd);
	const insideHome =
		relativeToHome === "" ||
		(relativeToHome !== ".." && !relativeToHome.startsWith(`..${sep}`) && !isAbsolute(relativeToHome));

	if (!insideHome) return cwd;
	return relativeToHome === "" ? "~" : `~${sep}${relativeToHome}`;
}

function sanitizeStatus(text: string): string {
	return text.replace(/[\r\n\t]/g, " ").replace(/ +/g, " ").trim();
}

function thinkingColor(level: string): ThinkingColor {
	switch (level) {
		case "minimal":
			return "thinkingMinimal";
		case "low":
			return "thinkingLow";
		case "medium":
			return "thinkingMedium";
		case "high":
			return "thinkingHigh";
		case "xhigh":
			return "thinkingXhigh";
		case "max":
			return "thinkingMax";
		default:
			return "thinkingOff";
	}
}

function installFooter(pi: ExtensionAPI, ctx: ExtensionContext): void {
	if (ctx.mode !== "tui") return;

	ctx.ui.setFooter((tui, theme, footerData) => {
		const unsubscribe = footerData.onBranchChange(() => tui.requestRender());

		return {
			dispose: unsubscribe,
			invalidate() {},
			render(width: number): string[] {
				if (width <= 0) return [];

				const separator = theme.fg("dim", " · ");
				const pwd = formatCwd(ctx.cwd);
				const branch = footerData.getGitBranch();
				const sessionName = ctx.sessionManager.getSessionName();

				let projectLine = theme.fg("accent", "◆ ") + theme.bold(theme.fg("text", pwd));
				if (branch) {
					projectLine += separator + theme.fg("mdLink", `git:${branch}`);
				}
				if (sessionName) {
					projectLine += separator + theme.fg("customMessageLabel", sessionName);
				}
				projectLine = truncateToWidth(projectLine, width, theme.fg("dim", "…"));

				const totals = collectUsage(ctx);
				const context = ctx.getContextUsage();
				const contextWindow = context?.contextWindow ?? ctx.model?.contextWindow ?? 0;
				const contextPercent = context?.percent;

				const metrics: Array<{ id: MetricId; color: FooterColor; text: string }> = [];
				if (totals.input > 0) metrics.push({ id: "input", color: "accent", text: `↑${formatTokens(totals.input)}` });
				if (totals.output > 0) metrics.push({ id: "output", color: "success", text: `↓${formatTokens(totals.output)}` });
				if (totals.cacheRead > 0) metrics.push({ id: "cacheRead", color: "mdLink", text: `R${formatTokens(totals.cacheRead)}` });
				if (totals.cacheWrite > 0) {
					metrics.push({ id: "cacheWrite", color: "customMessageLabel", text: `W${formatTokens(totals.cacheWrite)}` });
				}
				if (totals.latestCacheHitRate !== undefined && (totals.cacheRead > 0 || totals.cacheWrite > 0)) {
					metrics.push({
						id: "cacheHit",
						color: "customMessageLabel",
						text: `CH${totals.latestCacheHitRate.toFixed(1)}%`,
					});
				}
				if (totals.cost > 0) {
					metrics.push({ id: "cost", color: "warning", text: `$${totals.cost.toFixed(3)}` });
				}

				const contextText =
					contextPercent === null || contextPercent === undefined
						? `ctx ?/${formatTokens(contextWindow)}`
						: `ctx ${contextPercent.toFixed(1)}%/${formatTokens(contextWindow)}`;
				const contextColor: FooterColor =
					(contextPercent ?? 0) > 90 ? "error" : (contextPercent ?? 0) > 70 ? "warning" : "success";
				metrics.push({ id: "context", color: contextColor, text: contextText });

				const model = ctx.model;
				const modelId = model?.id ?? "no-model";
				const providerPrefix = model ? theme.fg("dim", `${model.provider}/`) : "";
				const modelText = theme.fg("accent", modelId);
				const thinkingLevel = pi.getThinkingLevel();
				const thinkingText = model?.reasoning
					? separator + theme.fg(thinkingColor(thinkingLevel), thinkingLevel === "off" ? "thinking off" : thinkingLevel)
					: "";

				let right = providerPrefix + modelText + thinkingText;
				let activeMetrics = metrics.slice();
				const renderMetrics = () =>
					activeMetrics.map((metric) => theme.fg(metric.color, metric.text)).join(separator);
				let left = renderMetrics();

				if (visibleWidth(left) + 2 + visibleWidth(right) > width && providerPrefix) {
					right = modelText + thinkingText;
				}

				for (const removable of ["cacheWrite", "cacheHit", "cacheRead", "cost"] satisfies MetricId[]) {
					if (visibleWidth(left) + 2 + visibleWidth(right) <= width) break;
					activeMetrics = activeMetrics.filter((metric) => metric.id !== removable);
					left = renderMetrics();
				}

				let statsLine: string;
				if (visibleWidth(left) + 2 + visibleWidth(right) <= width) {
					statsLine = left + " ".repeat(Math.max(2, width - visibleWidth(left) - visibleWidth(right))) + right;
				} else {
					const maxRightWidth = Math.min(visibleWidth(right), Math.max(8, Math.floor(width * 0.48)));
					right = truncateToWidth(right, maxRightWidth, "");
					const availableLeft = Math.max(0, width - visibleWidth(right) - 1);
					left = truncateToWidth(left, availableLeft, theme.fg("dim", "…"));
					const padding = " ".repeat(Math.max(1, width - visibleWidth(left) - visibleWidth(right)));
					statsLine = left + padding + right;
				}

				const lines = [projectLine, statsLine];
				const statuses = Array.from(footerData.getExtensionStatuses().entries())
					.sort(([a], [b]) => a.localeCompare(b))
					.map(([, text]) => sanitizeStatus(text))
					.filter(Boolean);
				if (statuses.length > 0) {
					lines.push(truncateToWidth(statuses.join(" "), width, theme.fg("dim", "…")));
				}

				return lines;
			},
		};
	});
}

export default function themeFooter(pi: ExtensionAPI): void {
	let enabled = true;

	pi.on("session_start", (_event, ctx) => {
		if (enabled) installFooter(pi, ctx);
	});

	pi.registerCommand("footer", {
		description: "Toggle the theme-aware footer, or use /footer custom|default",
		handler: async (args, ctx) => {
			const mode = args.trim().toLowerCase();
			if (mode === "custom") enabled = true;
			else if (mode === "default") enabled = false;
			else enabled = !enabled;

			if (enabled) installFooter(pi, ctx);
			else ctx.ui.setFooter(undefined);

			ctx.ui.notify(enabled ? "Theme-aware footer enabled" : "Built-in footer restored", "info");
		},
	});
}
