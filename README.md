# Speedtest CLI via Docker

This project builds a container to run the speedtest CLI (command-line utility) via Docker. It also provides a few utilities 

## Setup

### Docker Engine

You need to be in a UNIX environment with bash installed.
You will need to have docker engine and the docker command line installed.

### Build the container

Build the container image to prepare the speedtest utility.

```
./build.sh
```

### Create the data directory

If you want to use the `collect.sh` utility to collect JSON results, you will need to create the `data` directory.

```
mkdir data
```

## Running

### Open a shell

Use the `shell.sh` utility to open the docker container to a shell from which you can test the `speedtest` command.

```
./shell.sh
```

You can list nearby servers via `speedtest -L` within the shell environment.

### Collect speedtest results

Use the `collect.sh` utility to collect speedtest results in JSON format (requires the `data` directory to exist).

You may wish to modify `collect.sh` with a custom server or to select automatically based on your location.

```
./collect.sh
```
