import socket
import json

def check_port(port):
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        try:
            s.bind(("127.0.0.1", port))  # Try to bind to the port
            return True  # If bind is successful, port is available
        except socket.error:
            return False  # If bind fails, port is in use

# Check a range of ports
start_port = 5000
end_port = 5099
available_ports = []

for port in range(start_port, end_port + 1):
    if check_port(port):
        available_ports.append(port)

# number of ports to write to json file
val = int(input("Enter number of ports to write to json file: "))

with open('ports.json', 'w') as file:
        json.dump({"avail_ports": available_ports[:val]}, file)