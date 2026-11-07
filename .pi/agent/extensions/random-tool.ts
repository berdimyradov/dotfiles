import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import { Type } from "typebox";

export default function randomPhotoExtension(pi: ExtensionAPI) {
  pi.registerTool({
    name: "random_photo",
    label: "Random photo",
    description:
      "Get a random photo URL from JSONPlaceholder. Use when the user asks for a random photo.",
    parameters: Type.Object({}), // У инструмента нет аргументов.

    async execute(_toolCallId, _params, signal) {
      const timeoutSignal = AbortSignal.timeout(30_000);
      const requestSignal = signal
        ? AbortSignal.any([signal, timeoutSignal])
        : timeoutSignal;
      const response = await fetch(
        "https://jsonplaceholder.typicode.com/photos",
        { signal: requestSignal },
      );

      if (!response.ok) {
        throw new Error(`JSONPlaceholder returned HTTP ${response.status}`);
      }

      const photos = (await response.json()) as { url: string }[];
      if (!Array.isArray(photos) || photos.length === 0) {
        throw new Error("Список фотографий пуст");
      }

      const url = photos[Math.floor(Math.random() * photos.length)].url;
      return {
        content: [{ type: "text", text: url }], // Результат для модели.
        details: { url },
      };
    },
  });
}
