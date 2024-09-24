# Use the official Python image from the Docker Hub
FROM python:3

# Install the required system packages
RUN apt-get update && apt-get install -y python3-venv python3-pip

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Set up a virtual environment
RUN python3 -m venv venv

# Activate the virtual environment and install Django
RUN . venv/bin/activate && pip install django==3.2

# Run Django migrations
RUN . venv/bin/activate && python manage.py migrate

# Expose the port that the Django app will run on
EXPOSE 8000

# Run the Django development server
CMD ["venv/bin/python", "manage.py", "runserver", "0.0.0.0:8000"]

