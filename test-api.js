const axios = require('axios');

// Konfigurasi
const BASE_URL = 'http://localhost:1992/api/public';
const API_KEY = '5MOPBXcz5hFXiDjPdL71uXakbckjjY';
const TEST_NUMBER = '628123456789'; // Ganti dengan nomor test Anda

async function testApi() {
  console.log('🚀 Testing WhatsApp API...\n');

  try {
    // Test 1: Cek Status
    console.log('1. Testing Status API...');
    const statusResponse = await axios.get(`${BASE_URL}/status`, {
      params: { api_key: API_KEY }
    });
    console.log('✅ Status:', statusResponse.data);
    console.log('');

    // Test 2: Kirim Pesan (GET)
    console.log('2. Testing Send Message (GET)...');
    const getMessage = 'Hello from API Test (GET method)';
    const getResponse = await axios.get(`${BASE_URL}/send-message`, {
      params: {
        api_key: API_KEY,
        number: TEST_NUMBER,
        message: getMessage
      }
    });
    console.log('✅ Send Message (GET):', getResponse.data);
    console.log('');

    // Test 3: Kirim Pesan (POST)
    console.log('3. Testing Send Message (POST)...');
    const postMessage = 'Hello from API Test (POST method)';
    const postResponse = await axios.post(`${BASE_URL}/send-message`, {
      api_key: API_KEY,
      number: TEST_NUMBER,
      message: postMessage
    });
    console.log('✅ Send Message (POST):', postResponse.data);
    console.log('');

    // Test 4: Get Groups
    console.log('4. Testing Groups API...');
    const groupsResponse = await axios.get(`${BASE_URL}/groups`, {
      params: { api_key: API_KEY }
    });
    console.log('✅ Groups:', groupsResponse.data);
    console.log('');

    console.log('🎉 All tests completed successfully!');

  } catch (error) {
    console.error('❌ Test failed:', {
      message: error.message,
      response: error.response?.data || 'No response data'
    });
  }
}

// Test API key validation
async function testInvalidApiKey() {
  console.log('\n🔒 Testing API Key Validation...\n');

  try {
    const response = await axios.get(`${BASE_URL}/status`, {
      params: { api_key: 'invalid_key' }
    });
    console.log('❌ Should have failed with invalid API key');
  } catch (error) {
    if (error.response?.status === 401) {
      console.log('✅ API Key validation working:', error.response.data.message);
    } else {
      console.log('❌ Unexpected error:', error.message);
    }
  }
}

// Test missing API key
async function testMissingApiKey() {
  console.log('\n🔒 Testing Missing API Key...\n');

  try {
    const response = await axios.get(`${BASE_URL}/status`);
    console.log('❌ Should have failed with missing API key');
  } catch (error) {
    if (error.response?.status === 401) {
      console.log('✅ Missing API Key validation working:', error.response.data.message);
    } else {
      console.log('❌ Unexpected error:', error.message);
    }
  }
}

// Jalankan semua test
async function runAllTests() {
  console.log('🧪 Starting API Tests...\n');
  console.log('='.repeat(50));
  
  await testApi();
  await testInvalidApiKey();
  await testMissingApiKey();
  
  console.log('\n' + '='.repeat(50));
  console.log('✅ Test Suite Completed');
}

// Install axios jika belum ada
if (require.main === module) {
  runAllTests().catch(console.error);
}

module.exports = { testApi, runAllTests }; 