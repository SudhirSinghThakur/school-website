# Stage 2: Serve with Nginx
FROM nginx:stable-alpine

# Create a non-root user
RUN addgroup -g 10014 appgroup && adduser -D -u 10014 -G appgroup appuser

# Set permissions and use the non-root user
COPY default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html
RUN chown -R appuser:appgroup /usr/share/nginx/html

USER appuser

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]