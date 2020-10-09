/* eslint-disable strict, indent */
const { API_TOKEN } = require('./config');


function validateGameToken(req, res) {
    const authToken = req.get('Authorization');
    if (!authToken || authToken.split(' ')[1] !== API_TOKEN) {
        return res.status(401).json({ error: 'Unauthorized request' });
    }
}

module.exports = validateGameToken;