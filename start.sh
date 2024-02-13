# Install dependencies
sudo yum update -y
sudo yum install -y curl gnupg

# Install .NET Core runtime
sudo rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm
sudo yum install -y dotnet-runtime-7.0

# Build the ASP.NET Core project
dotnet build

# Publish the ASP.NET Core project
dotnet publish -c Release -o ~/publish

# Set up a reverse proxy using Nginx
sudo yum install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
sudo rm -f /etc/nginx/nginx.conf
sudo bash -c 'cat << EOF > /etc/nginx/nginx.conf
server {
    listen 80;
    server_name programming-quotes-api-gamma.vercel.app;
    location / {
        proxy_pass http://127.0.0.1:5000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection keep-alive;
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF'

# Start the ASP.NET Core project
cd ~/publish
nohup dotnet ProgrammingQuotesApi.dll &