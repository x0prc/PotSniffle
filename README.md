![A](https://github.com/user-attachments/assets/254ec99f-45d9-4062-a4bf-5021c46f937a)
A high-end honeypot simulation application built with Flutter, designed to detect and analyze malicious activities on computer systems. This application supports Windows, macOS, and Linux platforms.

## Features

- **Multi-Platform Support**: Run on Windows, macOS, and Linux.
- **Realistic Honeypot Simulation**: Emulates various services (e.g., SSH) to attract and log malicious interactions.
- **Interactive Dashboard**: Monitor the status of the honeypot and view logged interactions in real-time.
- **Logging Mechanism**: Capture and store interaction data for analysis.
- **User-Friendly Interface**: Built with Flutter for a responsive and intuitive user experience.

## Prerequisites
- [Flutter](https://flutter.dev/docs/get-started/install) installed on your machine.

## Installation/Running
### Configure Cowrie
`sudo apt-get install git python-virtualenv libssl-dev build-essential libpython-dev python2.7-minimal authbind` <br>
`sudo adduser --disabled-password cowrie`<br>
`sudo su - cowrie`<br>
`git clone http://github.com/micheloosterhof/cowrie`<br>
`cd cowrie`<br>
`virtualenv cowrie-env` <br>
`source cowrie-env/bin/activate` <br>
`pip install --upgrade pip` <br>
`pip install --upgrade -r requirements.txt` <br>

- Redirect traffic from port 22 to Cowrie's listening port (2222): <br>
`sudo iptables -t nat -A PREROUTING -p tcp --dport 22 -j REDIRECT --to-port 2222`

### Setup Dionaea
`git clone https://github.com/DinoTools/dionaea` <br>
`mkdir build` <br>
`cd build` <br>
`cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/dionaea ..` <br>
`make` <br>
`sudo make install` <br>

## Usage
- `flutter run`
- Use the dashboard to start or stop the honeypot service.
- Monitor logged interactions through the interface.
- View detailed logs of interactions by clicking on "View Interactions".

## Contributions
Contributions are welcome! If you have suggestions for improvements or new features, please open an issue or submit a pull request.

## License
This project is licensed under the GPL-3.0 License - see the LICENSE file for details.
