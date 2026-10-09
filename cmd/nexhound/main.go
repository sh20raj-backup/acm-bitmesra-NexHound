// NexHound is a lightweight Linux-first diagnostics toolkit.
package main

import (
	"fmt"
	"io"
	"os"
	"runtime"
)

var version = "dev"

type systemInfo struct {
	OS           string
	Architecture string
	GoVersion    string
	LogicalCPUs  int
}

func main() {
	if err := run(os.Args[1:]); err != nil {
		fmt.Fprintln(os.Stderr, "nexhound:", err)
		os.Exit(2)
	}
}

func run(args []string) error {
	return runWithOutput(args, os.Stdout)
}

func runWithOutput(args []string, out io.Writer) error {
	if len(args) == 0 {
		printUsage(out)
		return nil
	}

	switch args[0] {
	case "help", "-h", "--help":
		printUsage(out)
		return nil
	case "version", "-v", "--version":
		fmt.Fprintf(out, "nexhound %s (%s/%s)\n", version, runtime.GOOS, runtime.GOARCH)
		return nil
	case "system":
		if len(args) != 2 || args[1] != "info" {
			return fmt.Errorf("unknown system command; run 'nexhound help'")
		}
		printSystemInfo(out, collectSystemInfo())
		return nil
	default:
		return fmt.Errorf("unknown command %q; run 'nexhound help'", args[0])
	}
}

func collectSystemInfo() systemInfo {
	return systemInfo{
		OS:           runtime.GOOS,
		Architecture: runtime.GOARCH,
		GoVersion:    runtime.Version(),
		LogicalCPUs:  runtime.NumCPU(),
	}
}

func printSystemInfo(w io.Writer, info systemInfo) {
	fmt.Fprintln(w, "System information (local, read-only)")
	fmt.Fprintf(w, "Operating system: %s\n", unknownIfEmpty(info.OS))
	fmt.Fprintf(w, "Architecture: %s\n", unknownIfEmpty(info.Architecture))
	fmt.Fprintf(w, "Go runtime: %s\n", unknownIfEmpty(info.GoVersion))
	if info.LogicalCPUs > 0 {
		fmt.Fprintf(w, "Logical CPUs: %d\n", info.LogicalCPUs)
	} else {
		fmt.Fprintln(w, "Logical CPUs: unknown")
	}
}

func unknownIfEmpty(value string) string {
	if value == "" {
		return "unknown"
	}
	return value
}

func printUsage(w io.Writer) {
	fmt.Fprintln(w, "NexHound — lightweight Linux diagnostics toolkit\n\nUsage:\n  nexhound <command>\n\nCommands:\n  help         Show this help\n  version      Show version and build platform\n  system info  Show basic local OS/runtime information\n\nMore diagnostics will be added through reviewed, tested contributions.")
}
