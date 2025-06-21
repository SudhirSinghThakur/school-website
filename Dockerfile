# Stage 2: Serve with Nginx using a non-root user
FROM nginx:stable-alpine

# Create a non-root user with UID and GID in the Choreo-allowed range
RUN addgroup -g 10014 appgroup && adduser -D -u 10014 -G appgroup appuser

# Copy custom Nginx config
COPY default.conf /etc/nginx/conf.d/default.conf

# Copy build output from builder stage
COPY --from=builder /app/build /usr/share/nginx/html

# Set correct permissions for the static files
RUN chown -R 10014:10014 /usr/share/nginx/html

# Switch to non-root user
USER 10014

# Expose port used by Nginx
EXPOSE 80

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]