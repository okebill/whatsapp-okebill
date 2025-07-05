/**
 * Middleware untuk mengecek apakah user sudah login
 */
function isAuthenticated(req, res, next) {
  if (req.session && req.session.user) {
    return next();
  }
  
  if (req.xhr || req.headers.accept.indexOf('json') > -1) {
    return res.status(401).json({
      success: false,
      message: 'Unauthorized: Silakan login terlebih dahulu'
    });
  }
  
  res.redirect('/login');
}

/**
 * Middleware untuk mengecek apakah user belum login
 */
function isNotAuthenticated(req, res, next) {
  if (req.session && req.session.user) {
    return res.redirect('/dashboard');
  }
  next();
}

/**
 * Middleware untuk mengecek role user
 * @param {string|string[]} roles - Role yang diizinkan
 */
function hasRole(roles) {
  return (req, res, next) => {
    if (!req.session || !req.session.user) {
      return res.status(401).json({
        success: false,
        message: 'Unauthorized: Silakan login terlebih dahulu'
      });
    }

    const userRole = req.session.user.role;
    const allowedRoles = Array.isArray(roles) ? roles : [roles];

    if (!allowedRoles.includes(userRole)) {
      return res.status(403).json({
        success: false,
        message: 'Forbidden: Anda tidak memiliki akses'
      });
    }

    next();
  };
}

module.exports = {
  isAuthenticated,
  isNotAuthenticated,
  hasRole
}; 