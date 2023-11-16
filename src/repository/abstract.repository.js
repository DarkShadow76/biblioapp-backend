class AbstractRepository {
  constructor(model) {
    this.model = model;
  }

  async create(entity) {
    try {
      const newEntity = await this.model.create(entity);
      return newEntity;
    } catch (error) {
      console.error(error);
      return null;
    }
  }

  async findAll() {
    try {
      return await this.model.findAll();
    } catch (error) {
      console.error(error);
      return null;
    }
  }

  async findOne(id) {
    try {
      return await this.model.findOne({
        where: {
          id,
        },
      });
    } catch (error) {
      console.error(error);
      return null;
    }
  }

  async update(entity) {
    try {
      const foundEntity = await this.model.findOne({
        where: {
          id: entity.id,
        },
      });

      foundEntity.set(entity);
      await foundEntity.save();

      return foundEntity;
    } catch (error) {
      console.error(error);
      return null;
    }
  }

  async remove(id) {
    try {
      await this.model.destroy({
        where: {
          id,
        },
      });

      return true;
    } catch (error) {
      console.error(error);
      return false;
    }
  }
}

export default AbstractRepository;