/*const { MongoClient } = require('mongodb');

describe('DataBase Testing', () => {
    let connection;
    let db;

    beforeAll(async () => {
        connection = await MongoClient.connect(global.__MONGO_URI__, {
            useNewUrlParser: true,
            useUnifiedTopology: true,
        });
        db = await connection.db();
    });

    afterAll(async () => {
        await connection.close();
    });

    beforeEach(async () => {
        await db.collection('COLLECTION_NAME').deleteMany({});
    });

    it('should insert a new Task', async () => {
        const Task = {
        title: 'test',
        description: 'description test',
        }
        await db.collection('COLLECTION_NAME').insertOne(Task);
        const result = await db.collection('COLLECTION_NAME').findOne({ title: 'test' });
        expect(result).toEqual(Task);
    });

})*/
