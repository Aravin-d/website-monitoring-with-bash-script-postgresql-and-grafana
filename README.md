Description:
This project is designed to monitor the availability of websites by recording HTTP status codes and visualizing the data using Grafana. The system automatically checks the status of listed websites at regular intervals and provides a graphical overview of their availability.

How It Works:

Shell Script:

The script reads URLs from a sites.txt file.
It uses curl to send a request to each site and captures the HTTP status code.
The status code, along with a timestamp, is stored in a PostgreSQL database.

Database:

PostgreSQL is used to store the status codes and timestamps.
The database schema includes tables for tracking each URL and its corresponding status over time.
Grafana Dashboard:
The data stored in PostgreSQL is visualized in Grafana.
The dashboard updates every 5 minutes, providing near real-time visibility into the status of each monitored website.
Thresholds: If a status code is above 300, it turns yellow in Grafana, indicating a warning. If it’s above 400, it turns red, signaling a critical issue.

Setup Instructions:

Prerequisites:

PostgreSQL installed and configured.
Grafana setup with access to the PostgreSQL database.
Crontab configured to run the script at desired intervals.

Installation:

Clone this repository.
Place your list of websites in a sites.txt file in the same directory.
Set up your PostgreSQL database and configure the script with your connection details.
Schedule the script using crontab to run every 10 minutes.
Configure Grafana to visualize the data from your PostgreSQL database and set the thresholds.
Usage:

To manually run the script: ./website_status.sh
To view the Grafana dashboard, ensure your Grafana instance is running and connected to your PostgreSQL database.
Contributing:
Feel free to fork this repository and submit pull requests. Suggestions for improvements or additional features are welcome!
