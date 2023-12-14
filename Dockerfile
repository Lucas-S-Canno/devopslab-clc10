# Use an Official Python Image
FROM python:3

# Add a non-root user for running the application
RUN adduser --system --home /home/myapp myapp

# Set the working directory for the application
WORKDIR /home/myapp

# Set the location where the gunicorn binary is installed
ENV PATH="/home/myapp/.local/bin:${PATH}"

# Copy files from the local directory to the container
COPY --chown=myapp:nogroup app.py requirements.txt /home/myapp/

# Install Python dependencies specified in requirements.txt
RUN pip install --user --trusted-host pypi.python.org -r requirements.txt

# Change ownership of the application directory
RUN chown -R myapp:nogroup /home/myapp

# Switch to the non-root user
USER myapp

# Ensure the application starts
CMD ["gunicorn", "app:app"]