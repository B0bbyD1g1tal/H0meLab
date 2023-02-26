# Prusa-Link in Docker

```bash
# Build Image
docker build --no-cache -t prusa-link .
```

```bash
# Run container
docker run -d -p 8080:8080 -v /dev/ttyACM0:/dev/ttyACM0 prusa-link
```
