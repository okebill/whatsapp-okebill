// Alert system functions
function showAlert(message, type = 'info', duration = 5000) {
  const alertContainer = document.getElementById('alertContainer');
  if (!alertContainer) return;
  
  const alertId = 'alert-' + Date.now();
  
  const alertHtml = `
    <div id="${alertId}" class="alert alert-${type} alert-dismissible fade show" role="alert">
      <i class="fas fa-${getAlertIcon(type)} me-2"></i>
      ${message}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
  `;
  
  alertContainer.insertAdjacentHTML('beforeend', alertHtml);
  
  // Auto remove after duration
  if (duration > 0) {
    setTimeout(() => {
      const alertElement = document.getElementById(alertId);
      if (alertElement) {
        const bsAlert = new bootstrap.Alert(alertElement);
        bsAlert.close();
      }
    }, duration);
  }
}

function getAlertIcon(type) {
  switch(type) {
    case 'success': return 'check-circle';
    case 'danger': return 'exclamation-triangle';
    case 'warning': return 'exclamation-triangle';
    case 'info': return 'info-circle';
    default: return 'info-circle';
  }
}

// Show success alert
function showSuccess(message, duration = 5000) {
  showAlert(message, 'success', duration);
}

// Show error alert
function showError(message, duration = 8000) {
  showAlert(message, 'danger', duration);
}

// Show warning alert
function showWarning(message, duration = 6000) {
  showAlert(message, 'warning', duration);
}

// Show info alert
function showInfo(message, duration = 5000) {
  showAlert(message, 'info', duration);
}

// Clear all alerts
function clearAlerts() {
  const alertContainer = document.getElementById('alertContainer');
  if (alertContainer) {
    alertContainer.innerHTML = '';
  }
} 