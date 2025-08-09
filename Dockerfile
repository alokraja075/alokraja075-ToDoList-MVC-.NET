# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy csproj and restore dependencies
COPY *.sln ./
COPY ToDo/*.csproj ./ToDo/
RUN dotnet restore

# Copy all files
COPY . .

# Install EF tools and build
WORKDIR /src/ToDo
RUN dotnet tool install --global dotnet-ef --version 8.*
ENV PATH="$PATH:/root/.dotnet/tools"

# Publish
RUN dotnet publish -c Release -o /app

# Runtime stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS runtime
WORKDIR /app

# Install EF tools for migrations
RUN dotnet tool install --global dotnet-ef --version 8.*
ENV PATH="$PATH:/root/.dotnet/tools"

# Copy published app
COPY --from=build /app ./

EXPOSE 80

# Create startup script
RUN echo '#!/bin/bash\n\
echo "Waiting for database to be ready..."\n\
sleep 10\n\
echo "Running database migrations..."\n\
dotnet ef database update --no-build\n\
echo "Starting application..."\n\
dotnet ToDo.dll' > /app/start.sh && chmod +x /app/start.sh

ENTRYPOINT ["/app/start.sh"]
