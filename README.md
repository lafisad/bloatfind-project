# bloatfind
###### Version 1.1.92

A minimal cross-platform memory analyzer for Linux, macOS, and FreeBSD.

## Build

```sh
make
sudo make install   # optional, installs to /usr/local/bin
```

## Usage

```
bloatfind [OPTIONS]

  -v, --verbose       Increase verbosity (-v, -vv, -vvv)
      --verbose N     Set level 0–3
  -t, --test          Prompt for top process (even if no alert)
  -f, --force-dump    Aggressive memory dump (may crash process)
  -V, --version       Show version
  -h, --help          Show help
```

## What it does

Lists the top 20 processes by RSS. Processes using **>5 GB** trigger an interactive prompt:

| Input | Action |
|-------|--------|
| `y` / `yes` | Kill (SIGKILL) |
| `p` / `pause` | Suspend (SIGSTOP) |
| `e` / `exempt` | Skip for this session |
| `w` / `write` | Write memory dump |
| `n` / `no` | Skip |

## Memory dump

| Platform | Tool used |
|----------|-----------|
| Linux | `gcore`, fallback `gdb` |
| macOS | `lldb`, fallback `gcore` |
| FreeBSD | `gcore` |

Dumps are saved as `bloatfind_dump_<pid>_<name>.dump.core`.

## Requirements

| Platform | Dependency |
|----------|-----------|
| Linux | `/proc` filesystem |
| macOS | `libproc` (built-in) |
| FreeBSD | `sysctl` (built-in) |
| Dump (optional) | `gdb` / `lldb` |


> [!WARNING]
> Dumping does not always work. 
> For example - on **MacOS**, SIP just prohibits it due to intentional design.

> [!NOTE]
> We are using SemVer versioning.
## License

MIT — see [LICENSE](LICENSE)