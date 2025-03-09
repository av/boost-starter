# boost-starter

This is a minimal example of getting started with standalone installation of Harbor Boost with custom modules.

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

Modify/add the `boost_modules` directory to include your custom modules. See the [custom modules guide](https://github.com/av/harbor/wiki/5.2.-Harbor-Boost-Custom-Modules) to learn more.