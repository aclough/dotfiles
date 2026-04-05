curl -fsSL https://pkg.noctalia.dev/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/noctalia.gpg
echo "deb [signed-by=/etc/apt/keyrings/noctalia.gpg] https://pkg.noctalia.dev/apt questing main" | sudo tee /etc/apt/sources.list.d/noctalia.list
sudo apt update
sudo apt install noctalia-shell
