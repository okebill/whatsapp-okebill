const http = require('http');

// Test sederhana untuk cek API
function testSimple() {
    console.log('🔍 Testing simple HTTP request...');
    
    const options = {
        hostname: 'localhost',
        port: 1992,
        path: '/api/public/status?api_key=5MOPBXcz5hFXiDjPdL71uXakbckjjY',
        method: 'GET',
        timeout: 5000
    };

    const req = http.request(options, (res) => {
        console.log(`✅ Status Code: ${res.statusCode}`);
        console.log(`✅ Headers:`, res.headers);
        
        let data = '';
        res.on('data', (chunk) => {
            data += chunk;
        });
        
        res.on('end', () => {
            console.log('✅ Response:', data);
        });
    });

    req.on('error', (error) => {
        console.error('❌ Error:', error.message);
        console.error('❌ Code:', error.code);
        
        if (error.code === 'ECONNREFUSED') {
            console.log('💡 Server tidak berjalan di port 1992');
            console.log('💡 Jalankan: npm start');
        }
    });

    req.on('timeout', () => {
        console.error('❌ Request timeout');
        req.destroy();
    });

    req.end();
}

// Test koneksi ke port
function testPort() {
    const net = require('net');
    const socket = new net.Socket();
    
    console.log('🔍 Testing port 1992...');
    
    socket.setTimeout(3000);
    
    socket.connect(1992, 'localhost', () => {
        console.log('✅ Port 1992 is open');
        socket.destroy();
        testSimple();
    });
    
    socket.on('error', (error) => {
        console.error('❌ Port 1992 not accessible:', error.code);
        console.log('💡 Server belum berjalan. Jalankan: npm start');
    });
    
    socket.on('timeout', () => {
        console.error('❌ Connection timeout');
        socket.destroy();
    });
}

console.log('🧪 Simple API Test Starting...\n');
testPort(); 