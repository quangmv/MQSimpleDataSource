Pod::Spec.new do |s|

    s.name              	= 'MQSimpleDataSource'
    s.version           	= '1.0.0'
    s.summary           	= 'Flexible data sources for your UITableView'
    s.platform 			= :ios
    s.ios.deployment_target 	= "5.0"
    s.homepage          	= 'https://github.com/quangmv/MQSimpleDataSource'
    s.license           	= {
        :type => 'MIT',
        :file => 'LICENSE'
    }
    s.author            	= {
        'Quang' => 'quang.app@gmail.com'
    }
    s.source            	= {
        :git => 'https://github.com/quangmv/MQSimpleDataSource.git',
        :tag => s.version.to_s
    }
    s.source_files      	= 'Classes/*.{m,h}'
    s.requires_arc      	= true
end
