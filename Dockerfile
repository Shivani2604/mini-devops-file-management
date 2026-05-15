FROM mcr.microsoft.com/powershell

WORKDIR /app

COPY . .

CMD ["pwsh", "./scripts/file-management.ps1"]