//
//  CustomTableViewCell.swift
//  VKServicesApp
//
//  Created by mac on 14.07.2022.
//


import UIKit

class CustomTableViewCell: UITableViewCell {

     let iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        return iconImageView
    }()

     let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

     let subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.numberOfLines = 0
        subtitleLabel.font = .systemFont(ofSize: 10)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return subtitleLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(iconImageView)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(titleLabel)
        accessoryType = .disclosureIndicator
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 54),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            titleLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -32),
            subtitleLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            subtitleLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor)
        ])
    }
}

