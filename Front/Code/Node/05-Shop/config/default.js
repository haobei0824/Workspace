module.exports = {
    port: 3000,
    session: {
        secret: 'e-shop',
        key: 'e-shop',
        maxAge: 1000 * 60 * 30
    },
    mongodb: 'mongodb://localhost:27017/e-shop'
};