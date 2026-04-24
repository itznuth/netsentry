from http.server import BaseHTTPRequestHandler, HTTPServer
import json

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        body = {
            "service": "NetSentry mock web service",
            "status": "ok",
            "path": self.path
        }
        encoded = json.dumps(body).encode("utf-8")

        self.send_response(200)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(encoded)))
        self.end_headers()
        self.wfile.write(encoded)

    def log_message(self, format, *args):
        return

server = HTTPServer(("0.0.0.0", 8080), Handler)
print("Mock web service running on port 8080")
server.serve_forever()
