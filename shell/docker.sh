# Docker aliases
dock() {
    case $1 in
        start)
            open /Applications/Docker.app && \
            echo "Docker machine is running"
            ;;
        stop)
            killall Docker
            echo "Docker machine is stoped"
            ;;
        restart)
            killall Docker && open /Applications/Docker.app
            echo "Docker machine has restarted"
            ;;
        *)
           echo "Usage: dock <command>
where <command> is one of:
    start, stop, restart,
dock start - to start Docker machine
dock stop  - to stop Docker machine
dock restart - to restart Docker machine"
            ;;
    esac
}
