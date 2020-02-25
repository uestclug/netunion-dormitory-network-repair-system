// 配置本地数据库内容
module.exports = {
  // 调试数据库版本 11.7
  pgsql: {
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'netunion_dnrs',
    port: 3306,
    poolSize: 5
  }
}
