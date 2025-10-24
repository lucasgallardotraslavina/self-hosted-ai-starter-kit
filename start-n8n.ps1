# =========================
# Script PowerShell n8n + ngrok
# =========================

# 1️⃣ Variables de entorno n8n
$env:N8N_ENCRYPTION_KEY="PUk1VLV9AkhEGADVr1HUmn5SZxyyBHK"
$env:N8N_BLOCK_ENV_ACCESS_IN_NODE="true"
$env:N8N_RUNNERS_ENABLED="true"
$env:DB_SQLITE_POOL_SIZE="5"
$env:N8N_GIT_NODE_DISABLE_BARE_REPOS="true"

# 2️⃣ Arrancar n8n en segundo plano
Start-Process -NoNewWindow -FilePath "npx" -ArgumentList "n8n" 

# 3️⃣ Esperar 5 segundos para que n8n levante
Start-Sleep -Seconds 5

# 4️⃣ Levantar ngrok y crear túnel público al puerto 5678
Start-Process -NoNewWindow -FilePath "ngrok.exe" -ArgumentList "http 5678"

# 5️⃣ Mensaje
Write-Host "n8n iniciado y túnel ngrok activo. Abre ngrok para obtener la URL pública HTTPS."
