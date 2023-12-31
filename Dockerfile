FROM quay.io/keycloak/keycloak:23.0.3

# Copy themes to Keycloak themes directory
COPY themes /opt/keycloak/themes

COPY conf /opt/keycloak/conf

# Create a directory for Keycloak data (if not exists)
RUN mkdir -p /opt/keycloak/data/import

# Copy your realms to the newly created directory
COPY *.json /opt/keycloak/data/import/

# Expose Keycloak on port 8085
EXPOSE 8085

# Set the command to run Keycloak, binding to all network interfaces and importing realms during startup
