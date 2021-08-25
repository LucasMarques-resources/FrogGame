{
  "spriteId": {
    "name": "sSlime",
    "path": "sprites/sSlime/sSlime.yy",
  },
  "solid": false,
  "visible": true,
  "spriteMaskId": null,
  "persistent": false,
  "parentObjectId": {
    "name": "pEnemy",
    "path": "objects/pEnemy/pEnemy.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"isDnD":false,"eventNum":0,"eventType":3,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":2,"eventType":3,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [],
  "overriddenProperties": [
    {"propertyId":{"name":"flyEnemy","path":"objects/pEnemy/pEnemy.yy",},"objectId":{"name":"pEnemy","path":"objects/pEnemy/pEnemy.yy",},"value":"False","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"radiusChase","path":"objects/pEnemy/pEnemy.yy",},"objectId":{"name":"pEnemy","path":"objects/pEnemy/pEnemy.yy",},"value":"sprite_width * 3.5","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"hp","path":"objects/pShootable/pShootable.yy",},"objectId":{"name":"pShootable","path":"objects/pShootable/pShootable.yy",},"value":"50","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"spd","path":"objects/pEnemy/pEnemy.yy",},"objectId":{"name":"pEnemy","path":"objects/pEnemy/pEnemy.yy",},"value":"1","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"radiusChaseGetOut","path":"objects/pEnemy/pEnemy.yy",},"objectId":{"name":"pEnemy","path":"objects/pEnemy/pEnemy.yy",},"value":"sprite_width * 7","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"customAttack","path":"objects/pEnemy/pEnemy.yy",},"objectId":{"name":"pEnemy","path":"objects/pEnemy/pEnemy.yy",},"value":"False","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"radiusAttack","path":"objects/pEnemy/pEnemy.yy",},"objectId":{"name":"pEnemy","path":"objects/pEnemy/pEnemy.yy",},"value":"30","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"ownCustomAttack","path":"objects/pEnemy/pEnemy.yy",},"objectId":{"name":"pEnemy","path":"objects/pEnemy/pEnemy.yy",},"value":"True","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"timeCustomAttack","path":"objects/pEnemy/pEnemy.yy",},"objectId":{"name":"pEnemy","path":"objects/pEnemy/pEnemy.yy",},"value":"room_speed / 4","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
  ],
  "parent": {
    "name": "Enemys",
    "path": "folders/Objects/Enemys.yy",
  },
  "resourceVersion": "1.0",
  "name": "oSlime",
  "tags": [],
  "resourceType": "GMObject",
}