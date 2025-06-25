# boost-starter

This is a minimal example of getting started with standalone installation of [Harbor Boost](https://github.com/av/harbor/wiki/5.2.-Harbor-Boost) with [custom modules](https://github.com/av/harbor/wiki/5.2.-Harbor-Boost-Custom-Modules).

## Getting started

```bash
# 1. Clone the repository
git clone git@github.com:av/boost-starter.git

# 2. Move to the repository
cd boost-starter

# 3. Launch boost
./launch.sh
```

## Configuration

Modify the `launch.sh` script to configure your Boost instance. You'll find all supported environment variables documented in the [Boost Wiki](https://github.com/av/harbor/wiki/5.2.-Harbor-Boost#standalone-usage).

## Custom Modules

You'll find pre-included [`example`](./boost_modules/example.py) module in the `boost_modules` directory with a sample workflow that avoids invoking an LLM altogether and replies with "Hello, boost!" to any message.

```python
ID_PREFIX = 'example'

async def apply(chat, llm):
  await llm.emit_message('Hello, boost!')
```

You can further modify/add files in the `boost_modules` directory to include your custom modules. See the [custom modules guide](https://github.com/av/harbor/wiki/5.2.-Harbor-Boost-Custom-Modules) to learn more.

## One-liners

Below are one-liners to start some of the common boost workflows.

In every instance:
- Boost runs on port `8004`
- configured to connect to local Ollama running the same machine (adjust as needed).
- you can connect your OpenAI-compatible client (on the same host) to `http://localhost:8004/v1` and use the `sk-boost` as an API key.

### `klmbr`

Makes models more creative (or sometimes just crazy/weird).

```bash
docker run \
  -e "HARBOR_BOOST_OPENAI_URLS=http://172.17.0.1:11434/v1" \
  -e "HARBOR_BOOST_OPENAI_KEYS=sk-ollama" \
  -e "HARBOR_BOOST_MODULES=klmbr" \
  -e "HARBOR_BOOST_KLMBR_MODS=all" \
  -e "HARBOR_BOOST_KLMBR_PERCENTAGE=35" \
  -p 8004:8000 \
  ghcr.io/av/harbor-boost:latest
```

### Plain proxy

Will serve downstream models "as is".

```bash
docker run \
  -e "HARBOR_BOOST_OPENAI_URLS=http://172.17.0.1:11434/v1" \
  -e "HARBOR_BOOST_OPENAI_KEYS=sk-ollama" \
  -e "HARBOR_BOOST_BASE_MODELS=true" \
  -p 8004:8000 \
  ghcr.io/av/harbor-boost:latest
```

You can combine multiple "named" endpoints:

```bash
# Connects and serves models from Ollama and vLLM
docker run \
  -e "HARBOR_BOOST_OPENAI_URL_OLLAMA=https://ollama.foo.com/v1" \
  -e "HARBOR_BOOST_OPENAI_KEY_OLLAMA=sk-ollama" \
  -e "HARBOR_BOOST_OPENAI_URL_VLLM=https://vllm.foo.com/v1" \
  -e "HARBOR_BOOST_OPENAI_KEY_VLLM=sk-vllm" \
  -e "HARBOR_BOOST_BASE_MODELS=true" \
  -p 8004:8000 \
  ghcr.io/av/harbor-boost:latest
```

### Promx


```bash
docker run \
  -e "HARBOR_BOOST_OPENAI_URLS=http://172.17.0.1:11434/v1" \
  -e "HARBOR_BOOST_OPENAI_KEYS=sk-ollama" \
  -e "HARBOR_BOOST_MODULES=promx" \
  -p 8004:8000 \
  ghcr.io/av/harbor-boost:latest
```

### Update

`ghcr.io/av/harbor-boost:latest` is updated regularly with new modules and features. Run `docker pull` to update:

```bash
docker pull ghcr.io/av/harbor-boost:latest
```