CREATE TABLE `data_platform_delivery_document_item_picking_data`
(
    `DeliveryDocument`                                int(16) NOT NULL,
    `DeliveryDocumentItem`                            int(6) NOT NULL,
    `Product`                                         varchar(40) NOT NULL,
    `DeliverFromParty`                                int(12) DEFAULT NULL,
    `DeliverFromPlant`                                varchar(4) DEFAULT NULL,
    `DeliverFromPlantStorageLocation`                 varchar(4) DEFAULT NULL,
    `DeliverFromPlantStorageBin`                      varchar(10) DEFAULT NULL,
    `DeliverToParty`                                  int(12) DEFAULT NULL,
    `DeliverToPlant`                                  varchar(4) DEFAULT NULL,
    `DeliverToPlantStorageLocation`                   varchar(4) DEFAULT NULL,
    `DeliverToPlantStorageBin`                        varchar(10) DEFAULT NULL,
    `DeliverFromPlantPlannedPickingTime`              time DEFAULT NULL,
    `DeliverFromPlantPlannedPickingDate`              date DEFAULT NULL,
    `DeliverFromPlantPlannedPickingTime`              time DEFAULT NULL,
    `DeliverToPlantPlannedPickingDate`                date DEFAULT NULL,
    `DeliverToPlantPlannedPickingTime`                time DEFAULT NULL,
    `DeliverFromPlantActualPickingDate`               date DEFAULT NULL,
    `DeliverFromPlantActualPickingTime`               time DEFAULT NULL,
    `DeliverToPlantActualPickingDate`                 date DEFAULT NULL,
    `DeliverToPlantActualPickingTime`                 time DEFAULT NULL,
    `CreationDate`                                    date DEFAULT NULL,
    `CreationTime`                                    time DEFAULT NULL,
    `LastChangeDate`                                  date DEFAULT NULL,
    `LastChangeTime`                                  time DEFAULT NULL,
    `IsCancelled`                                     tinyint(1) DEFAULT NULL,
    `IsMarkedForDeletion`                             tinyint(1) DEFAULT NULL,
    
    PRIMARY KEY (`DeliveryDocument`, `DeliveryDocumentItem`),
    
    CONSTRAINT `DataPlatformDeliveryDocumentItemPickingData_fk` FOREIGN KEY (`DeliveryDocument`, `DeliveryDocumentItem`) REFERENCES `data_platform_delivery_document_item_data` (`DeliveryDocument`, `DeliveryDocumentItem`),
    CONSTRAINT `DataPlatformDeliveryDocumentItemPickingDataDeliverFromPlantStorageBin_fk` FOREIGN KEY (`Product`, `DeliverFromParty`, `DeliverFromPlant`, `DeliverFromPlantStorageLocation`, `DeliverFromPlantStorageBin`) REFERENCES `data_platform_product_master_storage_bin_data` (`Product`, `BusinessPartner`, `Plant`, `StorageLocation`, `StorageBin`),
    CONSTRAINT `DataPlatformDeliveryDocumentItemPickingDataDeliverToPlantStorageBin_fk` FOREIGN KEY (`Product`, `DeliverToParty`, `DeliverToPlant`, `DeliverToPlantStorageLocation`, `DeliverToPlantStorageBin`) REFERENCES `data_platform_product_master_storage_bin_data` (`Product`, `BusinessPartner`, `Plant`, `StorageLocation`, `StorageBin`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
