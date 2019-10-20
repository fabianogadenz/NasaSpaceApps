module.exports = (sequelize, DataTypes) => {
    var Model = sequelize.define('Complaint', {
      time: DataTypes.STRING,
      latitude: DataTypes.STRING,
      longitude: DataTypes.STRING
    })

    Model.prototype.toWeb = function(pw) {
      let json = this.toJSON()
      return json
    }
  
    return Model
  }
  