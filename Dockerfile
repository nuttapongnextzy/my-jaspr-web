# Use Flutter with Web enabled
FROM cirrusci/flutter:3.16.4

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Enable web (just in case)
RUN flutter config --enable-web

# Get dependencies
RUN dart pub get

# Build for web using Jaspr
RUN dart run jaspr build

# Serve using dart CLI or your preferred method
CMD ["dart", "run", "jaspr", "serve"]