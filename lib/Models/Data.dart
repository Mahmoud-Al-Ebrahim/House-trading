import 'Address.dart';
import 'Agent.dart';
import 'Association.dart';
import 'CoAgent.dart';
import 'Geo.dart';
import 'Mls.dart';
import 'Office.dart';
import 'Property.dart';
import 'Sales.dart';
import 'School.dart';
import 'Tax.dart';

class Data{
  String privateRemarks;
  Null showingContactName;
  Property property;
  int mlsId;
  Null showingContactPhone;
  String terms;
  String showingInstructions;
  Office office;
  Null leaseTerm;
  String disclaimer;
  Null specialListingConditions;
  Null originalListPrice;
  Address address;
  String agreement;
  String listDate;
  Agent agent;
  String modified;
  School school;
  List<String> photos;
  int listPrice;
  Null internetAddressDisplay;
  String listingId;
  Mls mls;
  Null internetEntireListingDisplay;
  Geo geo;
  Tax tax;
  CoAgent coAgent;
  Sales sales;
  Null ownership;
  String leaseType;
  Null virtualTourUrl;
  String remarks;
  Association association;
  Data(
      {this.privateRemarks,
        this.showingContactName,
        this.property,
        this.mlsId,
        this.showingContactPhone,
        this.terms,
        this.showingInstructions,
        this.office,
        this.leaseTerm,
        this.disclaimer,
        this.specialListingConditions,
        this.originalListPrice,
        this.address,
        this.agreement,
        this.listDate,
        this.agent,
        this.modified,
        this.school,
        this.photos,
        this.listPrice,
        this.internetAddressDisplay,
        this.listingId,
        this.mls,
        this.internetEntireListingDisplay,
        this.geo,
        this.tax,
        this.coAgent,
        this.sales,
        this.ownership,
        this.leaseType,
        this.virtualTourUrl,
        this.remarks,
        this.association});
  Data.fromJson(Map<String, dynamic> json) {
    privateRemarks = json['privateRemarks'];
    showingContactName = json['showingContactName'];
    property = json['property'] != null
        ? new Property.fromJson(json['property'])
        : null;
    mlsId = json['mlsId'];
    showingContactPhone = json['showingContactPhone'];
    terms = json['terms'];
    showingInstructions = json['showingInstructions'];
    office =
    json['office'] != null ? new Office.fromJson(json['office']) : null;
    leaseTerm = json['leaseTerm'];
    disclaimer = json['disclaimer'];
    specialListingConditions = json['specialListingConditions'];
    originalListPrice = json['originalListPrice'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    agreement = json['agreement'];
    listDate = json['listDate'];
    agent = json['agent'] != null ? new Agent.fromJson(json['agent']) : null;
    modified = json['modified'];
    school =
    json['school'] != null ? new School.fromJson(json['school']) : null;
    photos = json['photos'].cast<String>();
    listPrice = json['listPrice'];
    internetAddressDisplay = json['internetAddressDisplay'];
    listingId = json['listingId'];
    mls = json['mls'] != null ? new Mls.fromJson(json['mls']) : null;
    internetEntireListingDisplay = json['internetEntireListingDisplay'];
    geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
    tax = json['tax'] != null ? new Tax.fromJson(json['tax']) : null;
    coAgent =
    json['coAgent'] != null ? new CoAgent.fromJson(json['coAgent']) : null;
    sales = json['sales'] != null ? new Sales.fromJson(json['sales']) : null;
    ownership = json['ownership'];
    leaseType = json['leaseType'];
    virtualTourUrl = json['virtualTourUrl'];
    remarks = json['remarks'];
    association = json['association'] != null
        ? new Association.fromJson(json['association'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['privateRemarks'] = this.privateRemarks;
    data['showingContactName'] = this.showingContactName;
    if (this.property != null) {
      data['property'] = this.property.toJson();
    }
    data['mlsId'] = this.mlsId;
    data['showingContactPhone'] = this.showingContactPhone;
    data['terms'] = this.terms;
    data['showingInstructions'] = this.showingInstructions;
    if (this.office != null) {
      data['office'] = this.office.toJson();
    }
    data['leaseTerm'] = this.leaseTerm;
    data['disclaimer'] = this.disclaimer;
    data['specialListingConditions'] = this.specialListingConditions;
    data['originalListPrice'] = this.originalListPrice;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['agreement'] = this.agreement;
    data['listDate'] = this.listDate;
    if (this.agent != null) {
      data['agent'] = this.agent.toJson();
    }
    data['modified'] = this.modified;
    if (this.school != null) {
      data['school'] = this.school.toJson();
    }
    data['photos'] = this.photos;
    data['listPrice'] = this.listPrice;
    data['internetAddressDisplay'] = this.internetAddressDisplay;
    data['listingId'] = this.listingId;
    if (this.mls != null) {
      data['mls'] = this.mls.toJson();
    }
    data['internetEntireListingDisplay'] = this.internetEntireListingDisplay;
    if (this.geo != null) {
      data['geo'] = this.geo.toJson();
    }
    if (this.tax != null) {
      data['tax'] = this.tax.toJson();
    }
    if (this.coAgent != null) {
      data['coAgent'] = this.coAgent.toJson();
    }
    if (this.sales != null) {
      data['sales'] = this.sales.toJson();
    }
    data['ownership'] = this.ownership;
    data['leaseType'] = this.leaseType;
    data['virtualTourUrl'] = this.virtualTourUrl;
    data['remarks'] = this.remarks;
    if (this.association != null) {
      data['association'] = this.association.toJson();
    }
    return data;
  }
}