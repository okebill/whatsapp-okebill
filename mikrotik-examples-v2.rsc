# ================================================================
# Contoh Script Mikrotik untuk Eglobaltech WA-Gateway API
# Format Commercial Gateway (seperti gateway komersial)
# ================================================================

# Konfigurasi dasar
:global apiKey "5MOPBXcz5hFXiDjPdL71uXakbckjjY"
:global baseUrl "http://your-domain.com"
:global sender "628988409756"
:global adminNumber "628123456789"
:global groupId "120363185287561070@g.us"

# ================================================================
# 1. Script untuk notifikasi PPPoE user connect (UPDATED)
# ================================================================
:local nama "$user";
:local profile [/ppp secret get [find name=$nama] profile];
:local datetime "Tanggal:%20$[/system clock get date]%0AJam:%20$[/system clock get time]"
:local active [/ppp active print count];
:local totalSecret [/ppp secret print count]; 
:local inactive ($totalSecret - $active);

# Membuat daftar pengguna yang tidak aktif (maksimal 10)
:local inactiveUsers "";
:local i 0;

:foreach secret in=[/ppp secret find] do={
    :local secretName [/ppp secret get $secret name];
    :local isActive false;
    
    # Cek apakah secret ini aktif
    :foreach activeConn in=[/ppp active find] do={
        :local activeName [/ppp active get $activeConn name];
        :if ($activeName = $secretName) do={
            :set isActive true;
        }
    }
    
    # Jika tidak aktif, tambahkan ke daftar
    :if ($isActive = false) do={
        :set i ($i + 1);
        :if ($i <= 10) do={
            :set inactiveUsers ($inactiveUsers . "%0A" . $i . ".%20" . $secretName);
        }
    }
}

# Jika lebih dari 10, tambahkan "dan lainnya"
:if ($inactive > 10) do={
    :set inactiveUsers ($inactiveUsers . "%0Adan%20" . ($inactive - 10) . "%20lainnya...");
}

# Buat pesan notifikasi
:local message "*PPPoE%20TERHUBUNG*%0ANama:%20$user%0APaket:%20$profile%0A$datetime%0ATotal%20Aktif:%20*$active*%0ATotal%20Tidak%20Aktif:%20*$inactive*";

# Tambahkan daftar user tidak aktif jika ada
:if ($inactive > 0) do={
    :set message ($message . "%0A%0A*USER%20TIDAK%20AKTIF:*" . $inactiveUsers);
}

# KIRIM KE NOMOR ADMIN (Commercial Gateway Format)
/tool fetch url="$baseUrl/send-message?api_key=$apiKey&sender=$sender&number=$adminNumber&message=$message" keep-result=no;

# KIRIM KE GRUP (Commercial Gateway Format)
/tool fetch url="$baseUrl/send-message?api_key=$apiKey&sender=$sender&number=$groupId&message=$message" keep-result=no;

# ================================================================
# 2. Script untuk notifikasi system startup
# ================================================================
:local systemName [/system identity get name];
:local version [/system resource get version];
:local uptime [/system resource get uptime];
:local cpu [/system resource get cpu-load];
:local memory [/system resource get total-memory];
:local freememory [/system resource get free-memory];

:local message "*SYSTEM%20STARTUP*%0ARouter:%20$systemName%0AVersion:%20$version%0AUptime:%20$uptime%0ACPU:%20$cpu%25%0AMemory:%20$freememory/$memory";

/tool fetch url="$baseUrl/send-message?api_key=$apiKey&sender=$sender&number=$adminNumber&message=$message" keep-result=no;

# ================================================================
# 3. Script untuk monitoring resource harian
# ================================================================
:local systemName [/system identity get name];
:local datetime "Tanggal:%20$[/system clock get date]%0AJam:%20$[/system clock get time]"
:local version [/system resource get version];
:local uptime [/system resource get uptime];
:local cpu [/system resource get cpu-load];
:local memory [/system resource get total-memory];
:local freememory [/system resource get free-memory];
:local usedmemory ($memory - $freememory);
:local memoryPercent (($usedmemory * 100) / $memory);

# Hitung traffic interface
:local totalRx 0;
:local totalTx 0;
:foreach i in=[/interface find] do={
    :local rxBytes [/interface get $i rx-byte];
    :local txBytes [/interface get $i tx-byte];
    :set totalRx ($totalRx + $rxBytes);
    :set totalTx ($totalTx + $txBytes);
}

:local message "*LAPORAN%20HARIAN%20SYSTEM*%0A$datetime%0ARouter:%20$systemName%0AVersion:%20$version%0AUptime:%20$uptime%0ACPU:%20$cpu%25%0AMemory:%20$memoryPercent%25%20($usedmemory/$memory)%0ATraffic%20RX:%20$totalRx%20bytes%0ATraffic%20TX:%20$totalTx%20bytes";

/tool fetch url="$baseUrl/send-message?api_key=$apiKey&sender=$sender&number=$adminNumber&message=$message" keep-result=no;

# ================================================================
# 4. Script untuk notifikasi backup selesai
# ================================================================
:local systemName [/system identity get name];
:local datetime "Tanggal:%20$[/system clock get date]%0AJam:%20$[/system clock get time]"
:local message "*BACKUP%20SELESAI*%0ARouter:%20$systemName%0A$datetime%0ABackup%20konfigurasi%20berhasil%20dibuat.";

/tool fetch url="$baseUrl/send-message?api_key=$apiKey&sender=$sender&number=$adminNumber&message=$message" keep-result=no;

# ================================================================
# 5. Script untuk notifikasi hotspot user login
# ================================================================
:local username "$user";
:local userip "$address";
:local datetime "Tanggal:%20$[/system clock get date]%0AJam:%20$[/system clock get time]"
:local message "*HOTSPOT%20LOGIN*%0AUser:%20$username%0AIP:%20$userip%0A$datetime";

/tool fetch url="$baseUrl/send-message?api_key=$apiKey&sender=$sender&number=$adminNumber&message=$message" keep-result=no;

# ================================================================
# 6. Script untuk cek status API (test konektivitas)
# ================================================================
:local result [/tool fetch url="$baseUrl/status?api_key=$apiKey" as-value output=user];
:if ([:len $result] > 0) do={
            :put "API WA-Gateway: CONNECTED";
} else={
            :put "API WA-Gateway: FAILED";
}

# ================================================================
# 7. Script untuk kirim pesan ke group dengan format baru
# ================================================================
:local message "Test%20message%20ke%20group%20dari%20Mikrotik%20dengan%20format%20commercial%20gateway";
/tool fetch url="$baseUrl/send-message?api_key=$apiKey&sender=$sender&number=$groupId&message=$message" keep-result=no;

# ================================================================
# 8. Script untuk monitoring bandwidth user PPPoE
# ================================================================
:local nama "$user";
:local interface "$interface";
:local rxBytes [/interface get $interface rx-byte];
:local txBytes [/interface get $interface tx-byte];
:local totalBytes ($rxBytes + $txBytes);
:local datetime "Tanggal:%20$[/system clock get date]%0AJam:%20$[/system clock get time]"

:local message "*USAGE%20REPORT*%0AUser:%20$nama%0AInterface:%20$interface%0ARX:%20$rxBytes%20bytes%0ATX:%20$txBytes%20bytes%0ATotal:%20$totalBytes%20bytes%0A$datetime";

/tool fetch url="$baseUrl/send-message?api_key=$apiKey&sender=$sender&number=$adminNumber&message=$message" keep-result=no;

# ================================================================
# 9. Script untuk notifikasi user PPPoE disconnect
# ================================================================
:local nama "$user";
:local profile [/ppp secret get [find name=$nama] profile];
:local datetime "Tanggal:%20$[/system clock get date]%0AJam:%20$[/system clock get time]"
:local message "*PPPoE%20DISCONNECT*%0ANama:%20$user%0APaket:%20$profile%0A$datetime";

/tool fetch url="$baseUrl/send-message?api_key=$apiKey&sender=$sender&number=$adminNumber&message=$message" keep-result=no;

# ================================================================
# 10. Script sederhana untuk test kirim pesan
# ================================================================
:local testMessage "Test%20dari%20Mikrotik%20menggunakan%20Commercial%20Gateway%20Format";
/tool fetch url="$baseUrl/send-message?api_key=$apiKey&sender=$sender&number=$adminNumber&message=$testMessage" keep-result=no;

# ================================================================
# CONTOH URL FORMAT (sesuai permintaan Anda):
# https://contoh.domain/send-message?api_key=5MOPBXcz5hFXiDjPdL71uXakbckjjY&sender=628988409756&number=120363185287561070@g.us&message=ISI PESAN
# ================================================================

# Cara penggunaan:
# 1. Ganti "http://your-domain.com" dengan domain/IP server Anda
# 2. Ganti API key jika berbeda
# 3. Ganti sender ID dengan nomor WhatsApp pengirim Anda
# 4. Ganti nomor admin dengan nomor WhatsApp admin
# 5. Ganti group ID dengan ID grup yang valid
# 6. Copy script yang dibutuhkan ke System > Scripts
# 7. Jalankan script manual atau dengan scheduler
# ================================================================ 