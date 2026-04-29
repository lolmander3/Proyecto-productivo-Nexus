const http = require('http');
const app = require('./server');
const cors = require('cors');
const os = require('os');

const port = process.env.PORT || 3000;
const host = process.env.HOST || '0.0.0.0';

// Función para obtener la IP local
function getLocalIP() {
    const interfaces = os.networkInterfaces();
    for (const name of Object.keys(interfaces)) {
        for (const iface of interfaces[name]) {
            if (iface.family === 'IPv4' && !iface.internal) {
                return iface.address;
            }
        }
    }
    return 'localhost';
}

const localIP = getLocalIP();

app.use(cors({
    origin: '*',
    credentials: true,
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization', 'X-Requested-With']
}));

app.options('*', cors());
app.set('port', port);

const server = http.createServer(app);
server.listen(port, host, () => {
    console.log(`Servidor corriendo en http://localhost:${port}`);
    console.log(`También accesible desde: http://${localIP}:${port}`);
});