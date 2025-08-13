# Connecting to Windows Remote Desktop via Remmina

## Prerequisites
1. Access your novnc-remmina instance at https://novnc-remmina-production.up.railway.app
2. Enter your VNC password: `bubblete@`
3. Once in the desktop, you'll find Remmina in the Start Menu → Internet

## Creating a Windows RDP Connection

### Step 1: Open Remmina
- Click on the Start Menu (bottom left)
- Navigate to Internet → Remmina
- Or press Alt+F2 and type `remmina`

### Step 2: Create New Connection
1. Click the "+" button or "New connection profile"
2. In the connection dialog:
   - **Name**: Give your connection a name (e.g., "Windows Server")
   - **Protocol**: Select "RDP - Remote Desktop Protocol"
   - **Server**: Enter your Windows machine's IP address or hostname
   - **Username**: Your Windows username
   - **Password**: Your Windows password (or leave blank to prompt)
   - **Domain**: Your Windows domain (if applicable)

### Step 3: Advanced Settings (Optional)
- **Resolution**: Choose "Use client resolution" for best experience
- **Color depth**: True color (32 bpp) for best quality
- **Quality**: Best (slowest) for LAN connections
- **Sound**: Local for audio redirection
- **Security**: Negotiate for automatic selection

### Step 4: Connect
1. Click "Save and Connect" or just "Connect"
2. Accept any certificate warnings (first time only)
3. You should now see your Windows desktop

## Tips for Better Performance

1. **Network Quality**: 
   - For LAN: Use highest quality settings
   - For Internet: Reduce color depth and quality

2. **Clipboard Sharing**: 
   - Enable in Remmina preferences for copy/paste between local and remote

3. **File Sharing**:
   - Enable shared folders in the connection profile to transfer files

4. **Multiple Monitors**:
   - Remmina supports multiple monitors - configure in display settings

## Troubleshooting

### Cannot Connect
- Verify Windows machine has Remote Desktop enabled
- Check Windows Firewall allows RDP (port 3389)
- Ensure correct IP/hostname and credentials

### Performance Issues
- Reduce color depth to 16-bit
- Lower resolution
- Disable sound redirection
- Use "Poorest (fastest)" quality setting

### Authentication Failures
- Try with domain\username format
- Ensure user has remote desktop permissions on Windows
- Check if Network Level Authentication (NLA) is required

## Security Considerations
- Always use strong passwords
- Consider using VPN for internet connections
- Enable Network Level Authentication on Windows
- Use RD Gateway for additional security layer