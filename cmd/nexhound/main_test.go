package main

import (
	"os"
	"strings"
	"testing"
)

func TestRunHelp(t *testing.T) {
	old := os.Stdout
	r, w, err := os.Pipe()
	if err != nil {
		t.Fatal(err)
	}
	os.Stdout = w
	runErr := run([]string{"help"})
	_ = w.Close()
	os.Stdout = old

	var b strings.Builder
	buf := make([]byte, 1024)
	for {
		n, readErr := r.Read(buf)
		if n > 0 {
			b.Write(buf[:n])
		}
		if readErr != nil {
			break
		}
	}
	_ = r.Close()
	if runErr != nil {
		t.Fatalf("run(help) returned error: %v", runErr)
	}
	if !strings.Contains(b.String(), "Usage:") {
		t.Fatalf("help output missing Usage: %q", b.String())
	}
}

func TestRunUnknownCommand(t *testing.T) {
	err := run([]string{"not-a-command"})
	if err == nil {
		t.Fatal("expected error for unknown command")
	}
	if !strings.Contains(err.Error(), "unknown command") {
		t.Fatalf("unexpected error: %v", err)
	}
}

func TestVersionString(t *testing.T) {
	if version == "" {
		t.Fatal("version must not be empty")
	}
}
