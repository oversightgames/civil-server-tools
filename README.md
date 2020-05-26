# Civil Server Tools
The Civil Server Tools are simple to use launcher tools for community servers. In-depth documentation can be found [here](https://wiki.civil-game.com/en/docs/civil-server-tools).

# Usage
The tools are used to organize parameters for your server and launch/update it all in one place. Currently, there is only support for the Windows batch system, but implementation with shell scripting is possible for Linux configurations.

# Installation
After downloading the most recent package on [Github](https://github.com/oversightgames/civil-server-tools), followed by the actual application from Steam (in the tools section), the dedicated server needs some ports forwarded before use.

Once the tool package is installed from Steam, edit `civ-server.bat` and fill in the correct path in the location variable. The params variable is set to `-log` for your convenience, but if you wish to run your server in the background, you can erase this.
## Ports
The following ports should be forwarded inbound with both TCP/UDP. *Make sure these are forwarded on the network AND the Windows firewall.*
- 7777 (Unreal Engine)
- 27015-27030 (Steam)
## Configuration
For more information regarding the setup and installation of MySQL and integrating it with the Civil Database, view [this page](https://wiki.civil-game.com/en/docs/windows-server) for more.

### ServerConfig.ini
This config file is for basic parameters. The used keys are as follows:

Key | Description
--- | ---
NAME | Your server's name.
DESCRIPTION | A short description about your server.
ICON | (Coming soon) A 32px icon for your server.
MAX_PLAYERS | The limit to how many connections are desired.
WORLD | What [map](/docs/maps) file to load.
GAMEMODE | What [game mode](/docs/game-modes) to load.

### ServerData.ini
This config file is for database connection. The used keys are as follows:

Key | Description
--- | ---
MYSQL_SERVER_NAME | Server IP *(should be "localhost")*
MYSQL_USERNAME | Your MySQL username.
MYSQL_PASSWORD | Your MySQL password.
MYSQL_DB_NAME | Your DB name *(should be "CivilDB")*

### ServerPreferences.ini
This config file is not used in-game currently. Check back soon!

# Finalizing
After your information is set, run `civ-server.bat`. This will run the `civilServer.exe` included in your Steam tool, and will advertise your session on the Steamworks API. If you set everything up properly, your server will appear on the Community Games list in-game, and clients can connect to your server.

Things to keep in mind:

- Server icons disabled currently.
- Plugin Support is currently unavailable.
