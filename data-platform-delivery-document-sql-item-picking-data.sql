CREATE TABLE `data_platform_delivery_document_item_picking_data`
(
    `DeliveryDocument`                                    int(16) NOT NULL,
    `DeliveryDocumentItem`                                int(6) NOT NULL,
    `DeliveryDocumentItemPickingID`                       int(4) NOT NULL,
    `SupplyChainRelationshipID`                           int(16) NOT NULL,
    `SupplyChainRelationshipDeliveryID`                   int(6) NOT NULL,
    `SupplyChainRelationshipDeliveryPlantID`              int(4) NOT NULL,
    `Product`                                             varchar(40) NOT NULL,
    `Buyer`                                               int(12) NOT NULL,
    `Seller`                                              varchar(4) NOT NULL,
    `DeliverToParty`                                      int(12) NOT NULL,
    `DeliverToPlant`                                      varchar(4) NOT NULL,
    `DeliverToPlantStorageLocation`                       varchar(4) NOT NULL,
    `DeliverToPlantStorageBin`                            varchar(10) DEFAULT NULL,
    `DeliverFromParty`                                    int(12) NOT NULL,
    `DeliverFromPlant`                                    varchar(4) NOT NULL,
    `DeliverFromPlantStorageLocation`                     varchar(4) NOT NULL,
    `DeliverFromPlantStorageBin`                          varchar(10) DEFAULT NULL,
    `DeliverToPlantPlannedPickingQuantityInBaseUnit`      float(15) NOT NULL,
    `DeliverFromPlantPlannedPickingQuantityInBaseUnit`    float(15) NOT NULL,
    `DeliverToPlantPlannedPickingDate`                    date NOT NULL,
    `DeliverToPlantPlannedPickingTime`                    time NOT NULL,
    `DeliverFromPlantPlannedPickingDate`                  date NOT NULL,
    `DeliverFromPlantPlannedPickingTime`                  time NOT NULL,
    `DeliverToPlantActualPickingQuantityInBaseUnit`       float(15) DEFAULT NULL,
    `DeliverToPlantActualPickingDate`                     date DEFAULT NULL,
    `DeliverToPlantActualPickingTime`                     time DEFAULT NULL,
    `DeliverFromPlantActualPickingQuantityInBaseUnit`     float(15) DEFAULT NULL,
    `DeliverFromPlantActualPickingDate`                   date DEFAULT NULL,
    `DeliverFromPlantActualPickingTime`                   time DEFAULT NULL,
    `ItemPickingIsCompleted`                              tinyint(1) DEFAULT NULL,
    `CreationDate`                                        date NOT NULL,
    `CreationTime`                                        time NOT NULL,
    `LastChangeDate`                                      date NOT NULL,
    `LastChangeTime`                                      time NOT NULL,
    `IsCancelled`                                         tinyint(1) DEFAULT NULL,
    `IsMarkedForDeletion`                                 tinyint(1) DEFAULT NULL,
    
    PRIMARY KEY (`DeliveryDocument`, `DeliveryDocumentItem`, `DeliveryDocumentItemPickingID`),
    
    CONSTRAINT `DPFMDeliveryDocumentItemPickingData_fk` FOREIGN KEY (`DeliveryDocument`, `DeliveryDocumentItem`) REFERENCES `data_platform_delivery_document_item_data` (`DeliveryDocument`, `DeliveryDocumentItem`),
    CONSTRAINT `DPFMDeliveryDocumentItemPickingDataSCRDeliveryID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`) REFERENCES `data_platform_scr_delivery_relation_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`),
    CONSTRAINT `DPFMDeliveryDocumentItemPickingDataSCRDeliveryPlantID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `SupplyChainRelationshipDeliveryPlantID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`, `DeliverToPlant`, `DeliverFromPlant`) REFERENCES `data_platform_scr_delivery_plant_relation_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `SupplyChainRelationshipDeliveryPlantID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`, `DeliverToPlant`, `DeliverFromPlant`),
    CONSTRAINT `DPFMDeliveryDocumentItemPickingDataDeliverToPlantStorageLocation_fk` FOREIGN KEY (`DeliverToParty`, `DeliverToPlant`, `DeliverToPlantStorageLocation`) REFERENCES `data_platform_plant_general_data` (`BusinessPartner`, `Plant`, `StorageLocation`),
    -- CONSTRAINT `DPFMDeliveryDocumentItemPickingDataDeliverFromPlantStorageLocation_fk` FOREIGN KEY (`DeliverFromParty`, `DeliverFromPlant`, `DeliverFromPlantStorageLocation`) REFERENCES `data_platform_plant_general_data` (`BusinessPartner`, `Plant`, `StorageLocation`),  too long
    CONSTRAINT `DPFMDeliveryDocumentItemPickingDataDeliverToPlantStorageBin_fk` FOREIGN KEY (`Product`, `DeliverToParty`, `DeliverToPlant`, `DeliverToPlantStorageLocation`, `DeliverToPlantStorageBin`) REFERENCES `data_platform_product_master_storage_bin_data` (`Product`, `BusinessPartner`, `Plant`, `StorageLocation`, `StorageBin`),  
    CONSTRAINT `DPFMDeliveryDocumentItemPickingDataDeliverFromPlantStorageBin_fk` FOREIGN KEY (`Product`, `DeliverFromParty`, `DeliverFromPlant`, `DeliverFromPlantStorageLocation`, `DeliverFromPlantStorageBin`) REFERENCES `data_platform_product_master_storage_bin_data` (`Product`, `BusinessPartner`, `Plant`, `StorageLocation`, `StorageBin`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
