from http.server import BaseHTTPRequestHandler, HTTPServer

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"NetSentry mock web service is running.")

server = HTTPServer(("0.0.0.0", 8080), Handler)
print("Mock web service running on port 8080")
server.serve_forever()
