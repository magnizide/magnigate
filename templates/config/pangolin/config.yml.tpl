app:
    dashboard_url: "${PANGOLIN_DASHBOARD_URL}" #EXAMPLE: "https://example.com"
    log_level: "info"
    save_logs: false

domains:
    domain:
        base_domain: "${PANGOLIN_BASE_DOMAIN}" #EXAMPLE: "example.com"
        cert_resolver: "letsencrypt"
        prefer_wildcard_cert: false

server:
    external_port: 3000
    internal_port: 3001
    next_port: 3002
    internal_hostname: "pangolin"
    session_cookie_name: "p_session_token"
    resource_access_token_param: "p_token"
    resource_session_request_param: "p_session_request"

traefik:
    cert_resolver: "letsencrypt"
    http_entrypoint: "web"
    https_entrypoint: "websecure"

gerbil:
    start_port: 51820
    base_endpoint: "${GERBIL_BASE_ENDPOINT}" #EXAMPLE: "example.com"
    use_subdomain: false
    block_size: 29
    site_block_size: 30
    subnet_group: ${GERBIL_SUBNET_GROUP} #EXAMPLE: 100.89.137.0/20

rate_limits:
    global:
        window_minutes: 1
        max_requests: 100

email:
    smtp_host: "host.hoster.net"
    smtp_port: 587
    smtp_user: "no-reply@example.com"
    smtp_pass: "aaaaaaaaaaaaaaaaaa"
    no_reply: "no-reply@example.com"

users:
    server_admin:
        email: ${PANGOLIN_USER} #EXAMPLE: "admin@example.com"
        password: ${PANGOLIN_PASSWORD} #EXAMPLE: "Password123!"

flags:
    require_email_verification: true
    disable_signup_without_invite: true
    disable_user_create_org: true
    allow_raw_resources: true
    allow_base_domain_resources: true

