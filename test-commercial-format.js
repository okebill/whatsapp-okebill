const axios = require('axios');

// Konfigurasi
const BASE_URL = 'http://localhost:1992';
const API_KEY = '5MOPBXcz5hFXiDjPdL71uXakbckjjY';
const SENDER = '628988409756'; // Sesuai dengan contoh Anda
const TEST_NUMBER = '628123456789';
const TEST_GROUP = '120363185287561070@g.us'; // Grup NOC-EKONET

async function testCommercialFormat() {
  console.log('🚀 Testing Commercial Gateway Format...\n');

  try {
    // Test 1: Kirim pesan ke nomor pribadi
    console.log('1. Testing Send Message to Personal Number...');
    const personalMessage = 'Hello dari Commercial Gateway Format!';
    const personalResponse = await axios.get(`${BASE_URL}/send-message`, {
      params: {
        api_key: API_KEY,
        sender: SENDER,
        number: TEST_NUMBER,
        message: personalMessage
      }
    });
    console.log('✅ Personal Message:', personalResponse.data);
    console.log('');

    // Test 2: Kirim pesan ke grup (format yang Anda minta)
    console.log('2. Testing Send Message to Group (Your Format)...');
    const groupMessage = 'Test message ke grup dari Commercial Gateway!';
    const groupResponse = await axios.get(`${BASE_URL}/send-message`, {
      params: {
        api_key: API_KEY,
        sender: SENDER,
        number: TEST_GROUP,
        message: groupMessage
      }
    });
    console.log('✅ Group Message:', groupResponse.data);
    console.log('');

    // Test 3: Test format URL yang persis seperti contoh Anda
    console.log('3. Testing Exact URL Format (Your Example)...');
    const exactUrl = `${BASE_URL}/send-message?api_key=${API_KEY}&sender=${SENDER}&number=${TEST_GROUP}&message=ISI%20PESAN%20TEST`;
    const exactResponse = await axios.get(exactUrl);
    console.log('✅ Exact Format:', exactResponse.data);
    console.log('');

    // Test 4: Cek status dengan format sederhana
    console.log('4. Testing Status API...');
    const statusResponse = await axios.get(`${BASE_URL}/status`, {
      params: { api_key: API_KEY }
    });
    console.log('✅ Status:', statusResponse.data);
    console.log('');

    console.log('🎉 All commercial format tests completed successfully!');

  } catch (error) {
    console.error('❌ Test failed:', {
      message: error.message,
      response: error.response?.data || 'No response data',
      status: error.response?.status || 'No status'
    });
  }
}

// Test format URL yang PERSIS seperti contoh Anda
async function testExactFormat() {
  console.log('\n📋 Testing EXACT Format as Your Example...\n');
  
  // Format persis seperti: https://contoh.domain/send-message?api_key=pPq6bHQrx2r2AUobQpjmxtKuHJCowa&sender=628988409756&number=120363185287561070@g.us&message=ISI PESAN
  
  const testCases = [
    {
      name: 'Personal Number',
      url: `${BASE_URL}/send-message?api_key=${API_KEY}&sender=${SENDER}&number=628123456789&message=Hello%20Personal`
    },
    {
      name: 'Group Message',
      url: `${BASE_URL}/send-message?api_key=${API_KEY}&sender=${SENDER}&number=120363185287561070@g.us&message=Hello%20Group`
    },
    {
      name: 'Message with Spaces',
      url: `${BASE_URL}/send-message?api_key=${API_KEY}&sender=${SENDER}&number=${TEST_GROUP}&message=Pesan%20dengan%20spasi%20dan%20simbol!`
    }
  ];

  for (const testCase of testCases) {
    try {
      console.log(`Testing: ${testCase.name}`);
      console.log(`URL: ${testCase.url}`);
      
      const response = await axios.get(testCase.url);
      console.log(`✅ Result:`, response.data);
      console.log('');
    } catch (error) {
      console.error(`❌ Failed ${testCase.name}:`, error.response?.data || error.message);
      console.log('');
    }
  }
}

// Tampilkan contoh URL
function showExamples() {
  console.log('\n📝 Contoh Penggunaan URL Format Commercial Gateway:\n');
  
  console.log('1. Kirim ke Nomor Personal:');
  console.log(`   ${BASE_URL}/send-message?api_key=${API_KEY}&sender=${SENDER}&number=628123456789&message=Hello%20World`);
  console.log('');
  
  console.log('2. Kirim ke Grup:');
  console.log(`   ${BASE_URL}/send-message?api_key=${API_KEY}&sender=${SENDER}&number=120363185287561070@g.us&message=Hello%20Group`);
  console.log('');
  
  console.log('3. Cek Status:');
  console.log(`   ${BASE_URL}/status?api_key=${API_KEY}`);
  console.log('');
  
  console.log('4. Script Mikrotik:');
  console.log(`   /tool fetch url="${BASE_URL}/send-message?api_key=${API_KEY}&sender=${SENDER}&number=628123456789&message=PPPoE%20Connected:%20$user" keep-result=no;`);
  console.log('');
}

// Jalankan semua test
async function runAllTests() {
  console.log('🧪 Starting Commercial Gateway Format Tests...\n');
  console.log('='.repeat(70));
  
  await testCommercialFormat();
  await testExactFormat();
  showExamples();
  
  console.log('\n' + '='.repeat(70));
  console.log('✅ Commercial Format Test Suite Completed');
}

if (require.main === module) {
  runAllTests().catch(console.error);
}

module.exports = { testCommercialFormat, runAllTests }; 