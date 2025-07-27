# SmartClick Data Warehouse

A comprehensive data warehouse implementation for SmartClick, an e-commerce analytics platform that tracks consumer interactions, marketing performance, and business metrics across multiple digital channels.

## 📋 Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Database Schema](#database-schema)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Sample Queries](#sample-queries)
- [Data Analysis Capabilities](#data-analysis-capabilities)
- [File Structure](#file-structure)
- [Requirements](#requirements)
- [Contributing](#contributing)

## 🎯 Overview

SmartClick Data Warehouse is designed to support data-driven decision making for e-commerce businesses by providing:

- **Consumer Behavior Analytics**: Track user interactions, purchase patterns, and engagement metrics
- **Marketing Performance Analysis**: Measure campaign effectiveness, ROI, and channel performance
- **Product Analytics**: Monitor product views, purchases, and category performance
- **Location-based Insights**: Analyze geographical trends and regional performance
- **Device and Session Analytics**: Understand user behavior across different devices and sessions

## 🏗️ Architecture

The data warehouse implements both **Star Schema** and **Snowflake Schema** designs:

- **Galaxy Schema**: Optimized for complex analytical queries with multiple fact tables
- **Snowflake Schema**: Normalized approach for efficient storage and data integrity

### Schema Diagrams
- `SmartClick Galaxy Schema.pdf` - Visual representation of the galaxy schema design
- `SmartClick Snowflake Schema.pdf` - Visual representation of the snowflake schema design

## 📊 Database Schema

### Dimension Tables

#### Core Entities
- **CONSUMER**: Customer information (name, email, age, gender, phone)
- **PRODUCT**: Product catalog with category relationships
- **CATEGORY**: Product categorization
- **LOCATION**: Geographic information (location name, city, country)
- **SESSION**: User session data (start time, end time, date)
- **DEVICE_TYPE**: Device specifications (device name, operating system)
- **COMPANY_WEBSITE**: Website information
- **SERVICE**: Available services with type classification
- **SERVICE_TYPE**: Service categorization
- **INTERACTION_TYPE**: Types of user interactions
- **CAMPAIGN**: Marketing campaign details with date ranges
- **MEANS_USED_TO_WEBSITE**: Traffic source/channel information

### Fact Tables

#### CONSUMER_INTERACTION
Central fact table capturing:
- Consumer behavior metrics
- Product interactions
- Purchase data (items viewed, purchased, subtotals, checkout prices)
- Session and device context
- Location information

#### MARKETING_PERFORMANCE
Marketing analytics fact table including:
- Campaign performance metrics
- Impressions and click data
- Return on investment (ROI)
- Channel attribution

## ✨ Features

### Data Tracking Capabilities
- **Consumer Journey**: Complete user interaction history
- **E-commerce Metrics**: Items viewed, purchased, basket analysis
- **Marketing Attribution**: Campaign performance across channels
- **Geographic Analytics**: Location-based performance insights
- **Device Intelligence**: Cross-device user behavior analysis

### Analytics Support
- **OLAP Operations**: Support for complex analytical queries
- **Data Aggregation**: Pre-built views for common analytics
- **Performance Optimization**: Indexed tables for fast query execution
- **Scalable Design**: Modular schema supporting business growth

## 🚀 Installation

### Prerequisites
- PostgreSQL 12+ 
- Database management tool (pgAdmin, DBeaver, or command line)

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/HandharJunino/SmartClick-Data-Warehouse.git
   cd SmartClick-Data-Warehouse
   ```

2. **Create the database**
   ```sql
   -- Connect to PostgreSQL as superuser
   psql -U postgres
   
   -- Execute the main SQL file
   \i smartclick_data_warehouse.sql
   ```

3. **Verify installation**
   ```sql
   -- Connect to the new database
   \c smartclick_data_warehouse
   
   -- Check tables
   \dt
   ```

## 💻 Usage

### Basic Operations

```sql
-- Connect to the database
\c smartclick_data_warehouse

-- View all tables
\dt

-- Check data in a specific table
SELECT * FROM consumer LIMIT 10;
```

### Data Analysis Examples

```sql
-- Top performing consumers by total checkout value
SELECT * FROM consumer_interaction_summary;

-- Marketing ROI by campaign
SELECT 
    campaign_name,
    SUM(return_on_investment) as total_roi
FROM marketing_performance mp
JOIN campaign c ON mp.campaign_id = c.campaign_id
GROUP BY campaign_name
ORDER BY total_roi DESC;
```

## 🔍 Sample Queries

The database includes several pre-built analytical queries:

### 1. Top Performing Campaigns
```sql
-- Top 20 campaigns by ROI with rollup analysis
SELECT 
    ca.campaign_name,
    SUM(mp.return_on_investment) AS total_roi
FROM 
    marketing_performance mp
JOIN 
    campaign ca ON mp.campaign_id = ca.campaign_id
GROUP BY 
    ROLLUP(ca.campaign_name)
ORDER BY 
    total_roi DESC
LIMIT 20;
```

### 2. Consumer Interaction Summary
```sql
-- Comprehensive consumer behavior analysis
CREATE VIEW consumer_interaction_summary AS
SELECT 
    ci.consumer_id,
    c.name AS consumer_name,
    COUNT(*) AS total_interactions,
    SUM(ci.total_items_viewed) AS total_items_viewed,
    SUM(ci.total_items_purchased) AS total_items_purchased,
    SUM(ci.basket_subtotal) AS total_basket_subtotal,
    SUM(ci.total_checkout_price) AS total_checkout_price
FROM 
    CONSUMER_INTERACTION ci
JOIN 
    CONSUMER c ON ci.consumer_id = c.consumer_id
GROUP BY 
    ci.consumer_id, c.name 
ORDER BY 
    total_checkout_price DESC
LIMIT 20;
```

### 3. Channel Performance Analysis
```sql
-- Marketing channel effectiveness
SELECT 
    c.campaign_name,
    mw.reach_means,
    SUM(mp.total_impressions) AS total_impressions,
    SUM(mp.total_clicks) AS total_clicks,
    SUM(mp.return_on_investment) AS total_roi
FROM 
    marketing_performance mp
JOIN 
    campaign c ON mp.campaign_id = c.campaign_id
JOIN 
    means_used_to_website mw ON mp.reach_id = mw.reach_id
GROUP BY 
    ROLLUP(c.campaign_name, mw.reach_means)
ORDER BY 
    c.campaign_name, mw.reach_means;
```

## 📈 Data Analysis Capabilities

### Business Intelligence Support
- **Revenue Analysis**: Track sales performance across products, categories, and time periods
- **Customer Segmentation**: Analyze consumer behavior patterns and demographics
- **Marketing Attribution**: Measure campaign effectiveness and channel performance
- **Geographic Insights**: Regional performance analysis and expansion opportunities
- **Product Intelligence**: Best-selling products and category trends

### Key Performance Indicators (KPIs)
- Total Revenue and Average Order Value
- Customer Acquisition Cost (CAC)
- Return on Investment (ROI) by campaign
- Conversion rates by channel
- Geographic performance metrics
- Device-specific user behavior

## 📁 File Structure

```
SmartClick-Data-Warehouse/
├── README.md                           # This documentation
├── smartclick_data_warehouse.sql       # Main database script
├── SmartClick Galaxy Schema.pdf        # Galaxy schema diagram
├── SmartClick Snowflake Schema.pdf     # Snowflake schema diagram
└── .git/                              # Git repository files
```

## 🔧 Requirements

### System Requirements
- **Database**: PostgreSQL 12.0+
- **Memory**: Minimum 4GB RAM (8GB+ recommended for large datasets)
- **Storage**: 10GB+ available space
- **OS**: Windows, macOS, or Linux

### Skills Required
- Basic SQL knowledge
- Understanding of data warehouse concepts
- Familiarity with PostgreSQL (recommended)

## 🤝 Contributing

We welcome contributions to improve the SmartClick Data Warehouse project!

### How to Contribute
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-analysis`)
3. Commit your changes (`git commit -am 'Add new analysis query'`)
4. Push to the branch (`git push origin feature/new-analysis`)
5. Create a Pull Request

### Areas for Contribution
- Additional analytical queries
- Performance optimizations
- Documentation improvements
- Schema enhancements
- Data visualization scripts

## 📝 License

This project is part of an academic coursework for Practical Data Analytics and Mining.

## 📞 Contact

**Project Owner**: Handhwarah Muhumuza  
**Course**: Practical Data Analytics and Mining (Year 3)  
**Institution**: University of Portsmouth

For questions or support, please open an issue in the GitHub repository.

---

*Last updated: July 2025*
