CREATE TABLE `data_platform_delivery_document_item_picking_doc_data`
(
    `DeliveryDocument`               int(16) NOT NULL,
    `DeliveryDocumentItem`           int(6) NOT NULL,
    `DeliveryDocumentItemPickingID`  int(4) NOT NULL,
    `DocType`                        varchar(100) NOT NULL,
    `DocVersionID`                   int(4) NOT NULL,
    `DocID`                          varchar(100) NOT NULL,
    `FileExtension`                  varchar(20) NOT NULL,
    `FileName`                       varchar(200) DEFAULT NULL,
    `FilePath`                       varchar(1000) DEFAULT NULL,
    `DocIssuerBusinessPartner`       int(12) DEFAULT NULL,
  
    PRIMARY KEY (`DeliveryDocument`, `DeliveryDocumentItem`, `DeliveryDocumentItemPickingID`, `DocType`, `DocVersionID`, `DocID`),
    
    CONSTRAINT `DPFMDeliveryDocumentItemPickingDocData_fk` FOREIGN KEY (`DeliveryDocument`, `DeliveryDocumentItem`, `DeliveryDocumentItemPickingID`) REFERENCES `data_platform_delivery_document_item_picking_data` (`DeliveryDocument`, `DeliveryDocumentItem`, `DeliveryDocumentItemPickingID`), 
    CONSTRAINT `DPFMDeliveryDocumentItemPickingDocDataDocType_fk` FOREIGN KEY (`DocType`) REFERENCES `data_platform_doc_type_doc_type_data` (`DocType`),
    -- CONSTRAINT `DPFMDeliveryDocumentItemPickingDocDataDocIssuerBusinessPartner_fk` FOREIGN KEY (`DocIssuerBusinessPartner`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`) too long

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
