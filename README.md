# PHP Compatibility Checker Docker

Docker-based tool for checking PHP code compatibility across different PHP versions.

## Description

This project provides a Dockerized environment for running PHP Compatibility Checker on your PHP projects. It allows you to easily check your code for compatibility issues between different PHP versions without installing the tools locally.

## Prerequisites

- Docker

## Usage

1. Clone this repository:
   ```
   git clone https://github.com/yourusername/php-compatibility-checker-docker.git
   cd php-compatibility-checker-docker
   ```

2. Build the Docker image:
   ```
   docker build -t php-compatibility-checker .
   ```

3. Run the compatibility check on your project:
   ```
   docker run --rm -v /path/to/your/project:/project -e PHP_VERSION_MIN=5.6 -e PHP_VERSION_MAX=8.2 php-compatibility-checker
   ```

   Replace `/path/to/your/project` with the actual path to your PHP project's root directory.

## Customizing PHP Versions

You can customize the PHP version range by modifying the `PHP_VERSION_MIN` and `PHP_VERSION_MAX` environment variables when running the container.

## License

This project is open source and available under the [MIT License](LICENSE).

## Contributing

Contributions, issues, and feature requests are welcome!

## Support

If you encounter any problems or have any questions, please open an issue in this repository.
