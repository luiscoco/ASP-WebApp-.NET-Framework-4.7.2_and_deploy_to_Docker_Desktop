# Use a Windows image with .NET Framework 4.7.2
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.7.2-windowsservercore-ltsc2019

# Set the working directory
WORKDIR /inetpub/wwwroot

# Copy the application files from your host to your container
COPY ./WebApplication1 .

# Expose the port the app runs on
EXPOSE 80

# The final command to run your application will be in the base image
