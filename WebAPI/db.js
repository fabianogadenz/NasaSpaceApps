var mongoose = require('mongoose');
mongoose.connect('mongodb://localhost:27017/nodetest1');

var complaintSchema = new mongoose.Schema({
    date: String,
    latitude: String,
    longitude: String
}, { collection: 'usercollection' }
);
 
module.exports = { Mongoose: mongoose, UserSchema: userSchema }
