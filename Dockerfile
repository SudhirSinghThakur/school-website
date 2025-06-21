# Stage 1: Build the React app
FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Stage 2: Serve with Nginx using a non-root user
FROM nginx:stable-alpine

RUN addgroup -g 10014 appgroup && adduser -D -u 10014 -G appgroup appuser

# Copy custom Nginx config
COPY default.conf /etc/nginx/conf.d/default.conf

# Copy build output from builder stage
COPY --from=builder /app/build /usr/share/nginx/html
RUN chown -R 10014:10014 /usr/share/nginx/html

USER 10014

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]