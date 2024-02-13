# Install dependencies
yum update -y
yum install -y curl gnupg

# Install .NET Core runtime
rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm
yum install -y dotnet-runtime-7.0

# Build the ASP.NET Core project
dotnet build

dotnet watch run

# Set up a reverse proxy using Nginx
yum install -y nginx
systemctl start nginx
systemctl enable nginx
rm -f /etc/nginx/nginx.conf
bash -c 'cat << EOF > /etc/nginx/nginx.conf
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