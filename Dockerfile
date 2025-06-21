# Stage 1: Build the React app
FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Stage 2: Serve with Nginx using a non-root user
FROM nginx:stable-alpine

# Create a non-root user in Choreo's allowed UID/GID range
RUN addgroup -g 10014 appgroup && adduser -D -u 10014 -G appgroup appuser

# Copy custom Nginx config with temp paths redirected
COPY default.conf /etc/nginx/conf.d/default.conf

# Copy build artifacts from builder
COPY --from=builder /app/build /usr/share/nginx/html

# Adjust permissions
RUN chown -R 10014:10014 /usr/share/nginx/html

# Use non-root user
USER 10014

EXPOSE 8080

CMD ["nginx", "-g", "pid /tmp/nginx.pid; daemon off;"]